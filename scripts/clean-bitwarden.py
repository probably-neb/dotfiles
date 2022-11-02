import json
from typing import List, Any, Dict, Set

NEWVAULT = './new-bitwarden.json'

UNWANTED_URL_FIXES = ['www', 'accounts', 'account', 'com', 'org', 'net', 'tv', 'help', 'login', 'app', 'android', 'bbs', 'apply', 'auth', 'authenticate', 'users', 'us', 'wep', 'store', 'signup', 'signin', 'na', 'shop', 'my', 'play', 'web', 'connect', 'edu', 'secure', 'm', 'cdn']

def remove_url_fix(name: str) -> str:
    new = name
    for fix in UNWANTED_URL_FIXES:
        new = new.removesuffix(f'.{fix}')
        new = new.removeprefix(f'{fix}.')
    if new != name:
        print(name,'->',new)
    return new

with open('./bitwarden.json', 'r') as fp:
    vault = json.load(fp)
    vault_items: List[Dict] = vault['items']
    new_items = []
    passwords: Dict[str, List[str]] = {}
    for item in vault_items:
        name: str = item['name']
        if name == '--':
            print('removed --')
            continue
        item['name'] = remove_url_fix(name)
        new_items.append(item)
        try:
            pw = item['login']['password']
        except:
            pw = None
        pw_accounts = None
        if pw is not None:
            pw_accounts = passwords.get(pw)
        if pw_accounts is not None:
            pw_accounts.append(item['name'])
            passwords[pw] = pw_accounts
        else:
            passwords[pw] = [item['name']]
    repeated_passwords = {}
    for pw,accounts in passwords.items():
        if accounts is not None and len(accounts) > 1:
            repeated_passwords[pw] = accounts
    for pw,accounts in repeated_passwords.items():
        print(f"REPEATED PASSWORD: {pw} -- repeated {len(accounts)} times")
        print(accounts)
        print('')
    vault['items'] = new_items
    with open(NEWVAULT, 'w') as newvault:
        json.dump(vault, newvault, indent=4)
