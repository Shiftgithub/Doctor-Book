from django.contrib import admin

from .models import *

admin.site.register(BodyPart)
admin.site.register(Doctor)
admin.site.register(Department)
admin.site.register(DepartmentSpecification)
admin.site.register(Organ)
admin.site.register(OrgansProbleam)
admin.site.register(ProblemSpecification)
