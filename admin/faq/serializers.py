from rest_framework import serializers
from admin.faq.models import *


class FAQSerializer(serializers.ModelSerializer):
    class Meta:
        model = FAQ
        fields = '__all__'


class FAQDeleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = FAQ
        fields = ['deleted_at']