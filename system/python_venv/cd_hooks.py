HOME = '/home/embat'
SERVICES = '%s/data/professional/Catho/appletini/services' % HOME

hooks = {
    '%s/business' % SERVICES : 'aptn-business',
    '%s/programming/system' % HOME : 'system-python'
}


if __name__ == '__main__':
    import os, os.path

    fullpath = '%s/' % os.getcwd()
    for key in hooks:
        if fullpath.startswith(key):
            print(hooks[key])
            break