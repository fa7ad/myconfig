choices = ['<shift>+{', '<shift>+}']

if not store.has_key("bswitch"):
    store.set_value("bswitch", True)

switch = store.get_value("bswitch")

keyboard.send_keys(choices[int(switch)])

store.set_value("bswitch", not switch)