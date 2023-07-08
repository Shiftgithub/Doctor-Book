from django.utils import timezone
from rest_framework.response import Response
from rest_framework.decorators import api_view
from adminpanel.serializers.article_serializers import *


# Article 
@api_view(['POST'])
def store_article_data(request):
    if request.method == 'POST':
        article_serializer = ArticleSerializer(data=request.data)
        if article_serializer.is_valid():
            if article_serializer.save():
                return Response({'status': 200})
            else:
                return Response({'status': 403})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})


@api_view(['GET'])
def get_all_article_list(request):
    article = Article.objects.all()
    serializer = ArticleSerializer(article, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


@api_view(['GET'])
def article_dataview(request, article_id):
    # getting bodypart data from Article model ...
    article = Article.objects.get(id=article_id)

    # serializing article data ...
    serializer = ArticleSerializer(article, many=False)

    return Response(serializer.data)


@api_view(['PUT', 'POST'])
def edit_article_data(request, article_id):
    article = Article.objects.get(id=article_id)
    serializer = ArticleSerializer(article, data=request.data)
    if serializer.is_valid():
        if serializer.save(updated_at=timezone.now()):
            return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})


@api_view(['PUT', 'GET'])
def softdelete_article_data(request, article_id):
    article = Article.objects.get(id=article_id)
    serializer = ArticleDeleteSerializer(article, data=request.data)
    if serializer.is_valid():
        if serializer.save(deleted_at=timezone.now()):
            return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})


@api_view(['GET'])
def get_all_article_list_created_by(request, id):
    articles = Article.objects.filter(created_by=id, deleted_at=None)
    serializer = ArticleSerializer(articles, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)
