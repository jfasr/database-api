from rest_framework import generics
import api_web.models as models
import api_web.serializers as serializers

class UsuarioList(generics.ListCreateAPIView):
    queryset = models.Usuario.objects.all()
    serializer_class = serializers.UsuarioSerializer

class UsuarioDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = models.Usuario.objects.all()
    serializer_class = serializers.UsuarioSerializer


class CarrinhoList(generics.ListCreateAPIView):
    queryset = models.Carrinho.objects.all()
    serializer_class = serializers.CarrinhoSerializer

class CarrinhoDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = models.Carrinho.objects.all()
    serializer_class = serializers.CarrinhoSerializer


class ItemList(generics.ListCreateAPIView):
    queryset = models.Item.objects.all()
    serializer_class = serializers.ItemSerializer

class ItemDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = models.Item.objects.all()
    serializer_class = serializers.ItemSerializer


class ItemCarrinhoList(generics.ListCreateAPIView):
    queryset = models.ItemCarrinho.objects.all()
    serializer_class = serializers.ItemCarrinhoSerializer

class ItemCarrinhoDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = models.ItemCarrinho.objects.all()
    serializer_class = serializers.ItemCarrinhoSerializer

