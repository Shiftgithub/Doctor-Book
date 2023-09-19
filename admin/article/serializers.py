from .models import *
from rest_framework import serializers


class ArticleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Article
        fields = '__all__'


class ArticleDeleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Article
        fields = ['deleted_at']
