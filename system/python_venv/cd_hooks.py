HOME = '/home/embat'
CATHO_SERVICES = '%s/data/professional/Catho/appletini/services' % HOME
VIVAREAL_SERVICES = '%s/data/professional/VivaReal/solution' % HOME

hooks = {
    '%s/business' % CATHO_SERVICES : 'aptn-business',
    '%s/presentation' % CATHO_SERVICES : 'aptn-presentation',
    '%s/storage' % CATHO_SERVICES : 'aptn-storage',
    '%s/programming/system/python_venv' % HOME : 'system-python',
    '%s/backend' % VIVAREAL_SERVICES : 'vr-back',
    '%s/sower' % VIVAREAL_SERVICES : 'vr-sower'
}


if __name__ == '__main__':
    import os, os.path

    fullpath = '%s/' % os.getcwd()
    for key in hooks:
        if fullpath.startswith(key):
            print(hooks[key])
            break