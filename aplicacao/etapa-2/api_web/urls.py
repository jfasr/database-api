from django.urls import path
from rest_framework.urlpatterns import format_suffix_patterns
from api_web import views

urlpatterns = [
    path('usuarios/', views.UsuarioList.as_view()),
    path('usuarios/<pk>/', views.UsuarioDetail.as_view()),
    path('itens/', views.ItemList.as_view()),
    path('itens/<pk>/', views.ItemDetail.as_view()),
    path('carrinhos/', views.CarrinhoList.as_view()),
    path('carrinhos/<pk>/', views.CarrinhoDetail.as_view()),
    path('itenscarrinho/', views.ItemCarrinhoList.as_view()),
    path('itenscarrinho/<pk>/', views.ItemCarrinhoDetail.as_view()),
]

urlpatterns = format_suffix_patterns(urlpatterns)

