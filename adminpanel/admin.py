from django.contrib import admin
from .models.article_models import *
from .models.department_specification_models import *
from .models.faq_models import *
from .models.organ_problem_specification import *

admin.site.register(BodyPart)
admin.site.register(Department)
admin.site.register(DepartmentSpecification)
admin.site.register(Organ)
admin.site.register(OrgansProblemSpecification)
admin.site.register(FAQ)
admin.site.register(Article)
