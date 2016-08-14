import sys


pwd = sys.argv[1].strip()
if pwd == '/':
    print('/')
else:
    HOME = sys.argv[2].strip()
    if pwd.startswith(HOME):
        pwd = pwd.replace(HOME, '~', 1)

    dirnames = pwd.split('/')
    if not dirnames[0]:
        del dirnames[0]

    path_prompt = '/'.join([dirname for dirname in dirnames if dirname])
    if not pwd.startswith('~'):
        path_prompt = '/%s' % path_prompt
    print(path_prompt)