from rest_framework import serializers
from rest_framework.serializers import ModelSerializer,SerializerMethodField
from .models import Post,Comment
from django.shortcuts import get_object_or_404

class PostSerializer(ModelSerializer):
    class Meta: 
        model = Post
        fields = ["id","title","content","author"]

class PostDetailSerializer(ModelSerializer):
    author = serializers.ReadOnlyField(source='author.username')
    comments = serializers.SerializerMethodField()

    class Meta: 
        model = Post
        fields = ["id","title","content","author","date_posted","comments"] 

    def get_comments(self, obj):
        post = obj.id
        c_qs = Comment.objects.filter(post = post) 
        comments = CommentSerializer(c_qs, many = True).data
        return comments 

    
class PostUpdateSerializer(ModelSerializer):
    class Meta: 
        model = Post
        fields = ["id","title","content","author"] 

class PostDeleteSerializer(ModelSerializer):
    class Meta: 
        model = Post
        fields = ["id","title","content","author"] 

class PostCreateSerializer(ModelSerializer):
    class Meta:
        model = Post
        fields = ["id","title","content"] 

class CommentSerializer(ModelSerializer):
    user = serializers.ReadOnlyField(source='author.username')

    class Meta:
        model = Comment
        fields = ["comment", "user"]

class CreateCommentSerializer(ModelSerializer):
    user = serializers.ReadOnlyField(source='author.username')

    class Meta:
        model =  Comment
        fields = ["comment","user"]        
