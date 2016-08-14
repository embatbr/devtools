import sys
import os.path


if hasattr(sys, 'real_prefix'):
    print(os.path.basename(sys.prefix))
else:
    print()