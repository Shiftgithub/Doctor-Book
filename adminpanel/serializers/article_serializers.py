from rest_framework import serializers
from adminpanel.models.article_models import *


class ArticleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Article
        fields = '__all__'
