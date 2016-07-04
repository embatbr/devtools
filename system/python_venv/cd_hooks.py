SERVICES = '/home/embat/data/professional/Catho/appletini/services'

hooks = {
    '%s/business' % SERVICES : 'aptn-business'
}


if __name__ == '__main__':
    import os, os.path

    fullpath = '%s/' % os.getcwd()
    for key in hooks:
        if fullpath.startswith(key):
            print(hooks[key])
            break