choices = ['(', ')']

if not store.has_key("pswitch"):
    store.set_value("pswitch", False)

switch = store.get_value("pswitch")

keyboard.send_key(choices[int(switch)])

store.set_value("pswitch", not switch)