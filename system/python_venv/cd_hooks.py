HOME = '/home/embat'
CATHO_SERVICES = '%s/data/professional/Catho/appletini/services' % HOME
VIVAREAL_SERVICES = '%s/data/professional/VivaReal/solution' % HOME
DJANGO_TUTO = '%s/data/workspace/django-tuto' % HOME

local_venvs = {
    '%s/business' % CATHO_SERVICES : 'aptn-business',
    '%s/presentation' % CATHO_SERVICES : 'aptn-presentation',
    '%s/storage' % CATHO_SERVICES : 'aptn-storage',
    '%s/programming/system/python_venv' % HOME : 'system-python',
    '%s/backend' % VIVAREAL_SERVICES : 'vr-back',
    '%s/sower' % VIVAREAL_SERVICES : 'vr-sower'
}

global_venvs = [
    'tb_dev'
]


if __name__ == '__main__':
    import sys
    import os, os.path

    venv = ''
    cur_venv = None

    if hasattr(sys, 'real_prefix'):
        cur_venv = os.path.basename(sys.prefix)

    if cur_venv in global_venvs:
        venv = 'global-venv'

    fullpath = '%s/' % os.getcwd()
    for key in local_venvs:
        if fullpath.startswith(key):
            venv = local_venvs[key]
            break

    print(venv)