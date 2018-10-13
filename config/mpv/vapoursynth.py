# PostProcessing Script for VapourSynth
# Author: Jeremy
# http://www.ezoden.com/htpc-linux/55/how-to-setup-htpc-linux-introduction
#
# VapourSynth
# http://www.vapoursynth.com/
#
# FineSharp
# https://gist.githubusercontent.com/4re/8676fd350d4b5b223ab9/raw/e80dbda229bc9d0b50e5742982d40c3b6bcb14f2/finesharp.py
#
# HAvsFunc (Rezise - LSFMod)
# http://forum.doom9.org/showthread.php?t=166582
#
# Interpolation
# https://github.com/haasn/gentoo-conf/blob/master/home/nand/.mpv/filters/mvtools.vpy
#
# NNEDI3
# https://github.com/dubhater/vapoursynth-nnedi3
#
# Djcj collection of VapourSynth plugins
# https://github.com/darealshinji/vapoursynth-plugins


#########################################
# USER SETTINGS (OPTIONNAL)
#########################################
# Videos with higher framerate than this value are treated as High FPS videos
# [default: 30]
hifps=30

# SuperSampling value (multiply video resolution by this value before postprocessing)
# [default: 1.5]
ssf=1.0

#-----------------------------------
# SHARPEN
#-----------------------------------
# Select your sharpen ("finesharp" or "lsfmod") or don't use one (False)
# [default: "lsfmod" (only for FHD-HD-SD-SD_HiFPS)]
sharpen_uhd=False
sharpen_uhd_hifps=False
sharpen_fhd="lsfmod"
sharpen_fhd_hifps=False
sharpen_hd="lsfmod"
sharpen_hd_hifps=False
sharpen_sd="lsfmod"
sharpen_sd_hifps="lsfmod"

#-----------------------------------
# SHARPEN STRENGTH
#-----------------------------------
# Select the sharpen strength according to the sharpen selected
# LSFmod = 10 to 150 [default: 100]
# Finesharp = 1 to 3
sstr_uhd=100
sstr_uhd_hifps=100
sstr_fhd=100
sstr_fhd_hifps=100
sstr_hd=100
sstr_hd_hifps=100
sstr_sd=100
sstr_sd_hifps=100

#-----------------------------------
# SUPERSAMPLING
#-----------------------------------
# Use SuperSampling (True) or not (False)
# [default: True (only for FHD-HD-SD-SD_HiFPS)]
supersampling_uhd=False
supersampling_uhd_hifps=False
supersampling_fhd=True
supersampling_fhd_hifps=False
supersampling_hd=True
supersampling_hd_hifps=False
supersampling_sd=True
supersampling_sd_hifps=True

#-----------------------------------
# DEBLOCK
#-----------------------------------
# Use a Deblock filter (True) or not (False)
# [default: True (only for SD-SD-HiFPS)]
deblock_uhd=False
deblock_uhd_hifps=False
deblock_fhd=False
deblock_fhd_hifps=False
deblock_hd=False
deblock_hd_hifps=False
deblock_sd=True
deblock_sd_hifps=True

#-----------------------------------
# DEBAND
#-----------------------------------
# Use a Deband filter (True) or not (False)
# [default: True (only for FHD-HD-SD-SD_HiFPS)]
deband_uhd=False
deband_uhd_hifps=False
deband_fhd=True
deband_fhd_hifps=False
deband_hd=True
deband_hd_hifps=False
deband_sd=True
deband_sd_hifps=True

#-----------------------------------
# GPU SCALING
#-----------------------------------
# Use the GPU to make the last scaling (True) or not (False)
# [default: False]
gpu_scaling_uhd=False
gpu_scaling_uhd_hifps=False
gpu_scaling_fhd=False
gpu_scaling_fhd_hifps=False
gpu_scaling_hd=False
gpu_scaling_hd_hifps=False
gpu_scaling_sd=False
gpu_scaling_sd_hifps=False

#-----------------------------------
# NNEDI3
#-----------------------------------
# Use NNEDI3 (image doubling upscaler) (True) or not (False)
# Need a really really good CPU
# [default: False]
nnedi3_uhd=False
nnedi3_uhd_hifps=False
nnedi3_fhd=False
nnedi3_fhd_hifps=False
nnedi3_hd=False
nnedi3_hd_hifps=False
nnedi3_sd=False
nnedi3_sd_hifps=False

#-----------------------------------
# INTERPOLATION
#-----------------------------------
# Use Interpolation (True) or not (False)
# Need a good CPU
# [default: False]
smooth_uhd=False
smooth_uhd_hifps=False
smooth_fhd=False
smooth_fhd_hifps=False
smooth_hd=False
smooth_hd_hifps=False
smooth_sd=False
smooth_sd_hifps=False
#########################################
# END USER SETTINGS
#########################################

############################################################
############################################################
# FROM HERE DON'T TOUCH ANYTHING
############################################################
############################################################

#########################################
# INITIALISATION
#########################################
import vapoursynth as vs
import finesharp as fs
import havsfunc as haf
import subprocess
import string

core = vs.get_core()
clip = video_in

#########################################
# FUNCTIONS
#########################################
# FineSharp with SuperSampling
def FinesharpSs(clip, ssf=1.5, sstr=1.05):
	mWidth = clip.width
	mHeight = clip.height
	clip = haf.Resize(clip, int(mWidth*ssf), int(mHeight*ssf), kernel='spline64', noring=True)
	clip = fs.sharpen(clip, sstr=sstr)
	clip = haf.Resize(clip, mWidth, mHeight, kernel='spline64', noring=True)
	return clip

# Interpolation (SmoothMotion)
def Interpolation(clip):
	dst_fps = display_fps
	# Interpolating to fps higher than 60 is too CPU-expensive, smoothmotion can handle the rest.
	while dst_fps > 60:
		dst_fps /= 2
	src_fps_num = int(container_fps * 1e8)
	src_fps_den = int(1e8)
	dst_fps_num = int(dst_fps * 1e4)
	dst_fps_den = int(1e4)
	# Needed because clip FPS is missing
	clip = core.std.AssumeFPS(clip, fpsnum = src_fps_num, fpsden = src_fps_den)
	print("Reflowing from ",src_fps_num/src_fps_den," fps to ",dst_fps_num/dst_fps_den," fps.")
	sup  = core.mv.Super(clip, pel=2, hpad=16, vpad=16)
	bvec = core.mv.Analyse(sup, blksize=16, isb=True , chroma=True, search=3, searchparam=1)
	fvec = core.mv.Analyse(sup, blksize=16, isb=False, chroma=True, search=3, searchparam=1)
	clip = core.mv.BlockFPS(clip, sup, bvec, fvec, num=dst_fps_num, den=dst_fps_den, mode=3, thscd2=12)
	return clip

# Post Processing
def PostProcessing(clip, dispWidth, dispHeight, deblock, deband, nnedi3, supersampling, ssf, sharpen, sstr, gpu_scaling, smooth):

	mWidth = clip.width
	mHeight = clip.height

	scaling = False
	if mWidth > dispWidth or mHeight > dispWidth:
		scaling = "DOWN"
	elif mWidth < dispWidth and mHeight < dispWidth:
		scaling = "UP"

	ratio = (mWidth/mHeight)
	newHeight= round((dispWidth/ratio)/8)*8
	if newHeight > dispHeight:
		newHeight=dispHeight
		newWidth=round((newHeight*ratio)/8)*8
	else:
		newWidth=dispWidth

	if deblock:
		if (mWidth % 8 == 0) and (mHeight % 8 == 0):
			clip = core.deblock.Deblock(clip)

	if scaling == "UP":
		if nnedi3:
			if supersampling:
				clip = core.nnedi3.nnedi3_rpow2(clip, 2)
			if sharpen == "finesharp":
				clip = fs.sharpen(clip, sstr=sstr)
			elif sharpen == "lsfmod":
				ssf=1.0
				clip = haf.LSFmod(clip, defaults="slow", ss_x=ssf, ss_y=ssf, strength=sstr, noring=True)
			if supersampling:
				clip = haf.Resize(clip, mWidth, mHeight, kernel='spline64', noring=True)
			if not supersampling:
				clip = core.nnedi3.nnedi3_rpow2(clip, 2)
		else:
			if sharpen == "finesharp":
				if supersampling:
					clip = FinesharpSs(clip, ssf=ssf, sstr=sstr)
				else:
					clip = fs.sharpen(clip, sstr=sstr)
			elif sharpen == "lsfmod":
				if not supersampling:
					ssf=1.0
				clip = haf.LSFmod(clip, defaults="slow", ss_x=ssf, ss_y=ssf, strength=sstr, noring=True)
		if not gpu_scaling:
			clip = haf.Resize(clip, newWidth, newHeight, kernel='spline64', noring=True)
		if deband:
			clip = core.f3kdb.Deband(clip, grainy=0, grainc=0, output_depth=8)

	elif scaling == "DOWN":
		if sharpen == "finesharp":
			clip = fs.sharpen(clip, sstr=sstr)
		elif sharpen == "lsfmod":
			ssf=1.0
			clip = haf.LSFmod(clip, defaults="slow", ss_x=ssf, ss_y=ssf, strength=sstr)
		if not gpu_scaling:
			clip = haf.Resize(clip, newWidth, newHeight, kernel='spline64', noring=True)
		if deband:
			clip = core.f3kdb.Deband(clip, grainy=0, grainc=0, output_depth=8)

	else:
		if sharpen == "finesharp":
			if supersampling:
				clip = FinesharpSs(clip, ssf=ssf, sstr=sstr)
			else:
				clip = fs.sharpen(clip, sstr=sstr)
		elif sharpen == "lsfmod":
			if not supersampling:
				ssf=1.0
			clip = haf.LSFmod(clip, defaults="slow", ss_x=ssf, ss_y=ssf, strength=sstr)
		if deband:
			clip = core.f3kdb.Deband(clip, grainy=0, grainc=0, output_depth=8)

	if smooth:
		clip = Interpolation(clip)

	return clip


#########################################
# GET SOME INFOS
#########################################
# Video size
mWidth = clip.width
mHeight = clip.height

# Video framerate
mFps = container_fps

# Display resolution
display = subprocess.check_output('xrandr | grep "\*" | cut -d" " -f4',shell=True, universal_newlines=True).split('x')
dispWidth = int(display[0].strip())
dispHeight = int(display[1].strip())


#########################################
# PROFILES
#########################################
# 4k - UHD - 2160p
if mWidth >= 1921 or mHeight >= 1081:
	if mFps <= hifps:
		clip = PostProcessing(clip, dispWidth, dispHeight, deblock_uhd, deband_uhd, nnedi3_uhd, supersampling_uhd, ssf, sharpen_uhd, sstr_uhd, gpu_scaling_uhd, smooth_uhd)
	else:
		clip = PostProcessing(clip, dispWidth, dispHeight, deblock_uhd_hifps, deband_uhd_hifps, nnedi3_uhd_hifps, supersampling_uhd_hifps, ssf, sharpen_uhd_hifps, sstr_uhd_hifps, gpu_scaling_uhd_hifps, smooth_uhd_hifps)
# Full HD - 1080p
elif mWidth == 1920 or mHeight >= 721:
	if mFps <= hifps:
		clip = PostProcessing(clip, dispWidth, dispHeight, deblock_fhd, deband_fhd, nnedi3_fhd, supersampling_fhd, ssf, sharpen_fhd, sstr_fhd, gpu_scaling_fhd, smooth_fhd)
	else:
		clip = PostProcessing(clip, dispWidth, dispHeight, deblock_fhd_hifps, deband_fhd_hifps, nnedi3_fhd_hifps, supersampling_fhd_hifps, ssf, sharpen_fhd_hifps, sstr_fhd_hifps, gpu_scaling_fhd_hifps, smooth_fhd_hifps)
# HD - 720p
elif mWidth == 1280 or mHeight == 720:
	if mFps <= hifps:
		clip = PostProcessing(clip, dispWidth, dispHeight, deblock_hd, deband_hd, nnedi3_hd, supersampling_hd, ssf, sharpen_hd, sstr_hd, gpu_scaling_hd, smooth_hd)
	else:
		clip = PostProcessing(clip, dispWidth, dispHeight, deblock_hd_hifps, deband_hd_hifps, nnedi3_hd_hifps, supersampling_hd_hifps, ssf, sharpen_hd_hifps, sstr_hd_hifps, gpu_scaling_hd_hifps, smooth_hd_hifps)
# SD - 480p
else:
	if mFps <= hifps:
		clip = PostProcessing(clip, dispWidth, dispHeight, deblock_sd, deband_sd, nnedi3_sd, supersampling_sd, ssf, sharpen_sd, sstr_sd, gpu_scaling_sd, smooth_sd)
	else:
		clip = PostProcessing(clip, dispWidth, dispHeight, deblock_sd_hifps, deband_sd_hifps, nnedi3_sd_hifps, supersampling_sd_hifps, ssf, sharpen_sd_hifps, sstr_sd_hifps, gpu_scaling_sd_hifps, smooth_sd_hifps)


#########################################
# VIDEO OUTPUT
#########################################
clip.set_output()





