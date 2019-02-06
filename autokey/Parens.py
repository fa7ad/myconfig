choices = ['(', ')']

if not store.has_key("pswitch"):
    store.set_value("pswitch", True)

switch = store.get_value("pswitch")

keyboard.send_key(choices[int(switch)])

store.set_value("pswitch", not switch)