from rest_framework import serializers
from .models import *


class BodyPartSerializer(serializers.ModelSerializer):
    class Meta:
        model = BodyPart
        fields = '__all__'

class BodyPartDeleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = BodyPart
        fields = ['deleted_at']


class OrganStoreSerializer(serializers.ModelSerializer):
    class Meta:
        model = Organ
        fields = '__all__'


class OrganSerializer(serializers.ModelSerializer):
    bodypart = serializers.CharField(source='bodypart_name')

    class Meta:
        model = Organ
        fields = ['id', 'name', 'description','created_at','updated_at','deleted_at', 'bodypart']

class OrganDeleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Organ
        fields = ['deleted_at']

class OrganProblemStoreSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrgansProblem
        fields = '__all__'


class OrganProblemSerializer(serializers.ModelSerializer):
    organ = serializers.CharField(source='organ_name')

    class Meta:
        model = OrgansProblem
        fields = ['id', 'name', 'description', 'organ']


class ProblemSpecificationStoreSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProblemSpecification
        fields = '__all__'


class ProblemSpecificationSerializer(serializers.ModelSerializer):
    organ = serializers.CharField(source='organ_name')

    class Meta:
        model = ProblemSpecification
        fields = ['id', 'specification', 'description', 'organ']


class DepartmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Department
        fields = '__all__'


class DepartmentSpecificationStoreSerializer(serializers.ModelSerializer):
    class Meta:
        model = DepartmentSpecification
        fields = '__all__'


class DepartmentSpecificationSerializer(serializers.ModelSerializer):
    department = serializers.CharField(source='department_name')
    specification = serializers.CharField(source='problemspecification')

    class Meta:
        model = DepartmentSpecification
        fields = ['id', 'description', 'department',
                  'specification']

class FAQSerializer(serializers.ModelSerializer):
    class Meta:
        model = FAQ
        fields = '__all__'

class ArticleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Article
        fields = '__all__'
