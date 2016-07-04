SERVICES = '/home/embat/data/professional/Catho/appletini/service'

hooks = {
    '%s/business-logic/' % SERVICES : 'aptn-business'
}


if __name__ == '__main__':
    import os, os.path

    fullpath = '%s/' % os.getcwd()
    for key in hooks:
        if fullpath.startswith(key):
            print(hooks[key])
            break