from pipeline.view.base import View
from pipeline.shell import Shell, EnvVarNotFound
from mako.template import Template

import os
import sys
import pkg_resources

class WebView(View):

    def __init__(self):
        pass

    def execute(self, method_name, module_name, vars):

        shell = Shell()
        filename = os.path.join(pkg_resources.resource_filename(module_name, 'view'), 'web', "%s.mako" % method_name)

        try:
            mytemplate = Template(filename=filename)
        except IOError:
            return 

        return mytemplate.render(**vars)


