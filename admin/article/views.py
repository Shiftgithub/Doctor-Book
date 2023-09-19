from .serializers import *
from django.utils import timezone
from django.shortcuts import get_object_or_404
from rest_framework.response import Response
from rest_framework.decorators import api_view


# Article
@api_view(['POST'])
def store_article_data(request):
    article_serializer = ArticleSerializer(data=request.data)
    if article_serializer.is_valid():
        if article_serializer.save():
            return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})


@api_view(['GET'])
def get_all_article_list(request):
    articles = Article.objects.filter(deleted_at=None).order_by('id')
    serializer = ArticleSerializer(articles, many=True)
    return Response(serializer.data)


@api_view(['GET'])
def article_dataview(request, article_id):
    # Getting article data from Article model ...
    article = get_object_or_404(Article, id=article_id, deleted_at=None)

    # Serializing article data ...
    serializer = ArticleSerializer(article)

    return Response(serializer.data)


@api_view(['PUT', 'POST'])
def edit_article_data(request, article_id):
    article = Article.objects.get(id=article_id, deleted_at=None)
    serializer = ArticleSerializer(article, data=request.data, partial=True)

    if serializer.is_valid():
        if 'image' in request.data and request.data['image']:
            # New image is selected
            serializer.validated_data['image'] = request.data['image']
        else:
            # No new image selected, retain the existing image
            serializer.validated_data['image'] = article.image

        serializer.save(updated_at=timezone.now())
        return Response({'status': 200})
    else:
        return Response({'status': 403})


@api_view(['PUT', 'GET'])
def softdelete_article_data(request, article_id):
    article = get_object_or_404(Article.objects.filter(id=article_id, deleted_at=None).order_by('id'))
    serializer = ArticleDeleteSerializer(article, data=request.data)
    if serializer.is_valid():
        serializer.save(deleted_at=timezone.now())
        return Response({'status': 200})
    else:
        return Response({'status': 403})


@api_view(['GET'])
def get_all_article_list_created_by(request, id):
    articles = Article.objects.filter(created_by=id, deleted_at=None)
    serializer = ArticleSerializer(articles, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


@api_view(['GET'])
def get_article_by_id(request, article_id):
    article = get_object_or_404(Article, id=article_id, deleted_at=None)
    serializer = ArticleSerializer(article)
    return Response(serializer.data)
