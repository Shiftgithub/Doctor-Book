from django.contrib import admin

from .models.article_models import *
from .models.bodypart_models import *
from .models.doctor_models import *
from .models.department_models import *
from .models.department_specification_models import *
from .models.faq_models import *
from .models.organ_models import *
from .models.organ_problem_models import *
from .models.problem_specification_models import *

admin.site.register(BodyPart)
admin.site.register(Department)
admin.site.register(DepartmentSpecification)
admin.site.register(Organ)
admin.site.register(OrgansProblem)
admin.site.register(FAQ)
admin.site.register(Article)
