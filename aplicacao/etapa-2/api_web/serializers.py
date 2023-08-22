from rest_framework.serializers import ModelSerializer
import api_web.models as models

class UsuarioSerializer(ModelSerializer):
    class Meta:
        model = models.Usuario
        fields =  '__all__'

class CarrinhoSerializer(ModelSerializer):
    class Meta:
        model = models.Carrinho
        fields = '__all__'

class ItemSerializer(ModelSerializer):
    class Meta:
        model = models.Item
        fields = '__all__'

class ItemCarrinhoSerializer(ModelSerializer):
    class Meta:
        model = models.ItemCarrinho
        fields = '__all__'
