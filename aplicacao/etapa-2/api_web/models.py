from django.db import models


class Usuario(models.Model):
    """
    Um usuário que realiza compras.
    """
    email_primario = models.EmailField(primary_key=True, max_length=30)
    nome = models.CharField(max_length=30)
    riot_points = models.IntegerField


class EmailSecundarioUsuario(models.Model):
    """
    Possível emails secundários de um usuário
    """
    email_secundario = models.EmailField(max_length=30)
    usuario = models.ForeignKey(Usuario, on_delete=models.CASCADE)


class Carrinho(models.Model):
    """
    Carrinho de compras de um usuário.
    """
    id_carrinho = models.AutoField(primary_key=True)
    usuario = models.ForeignKey(Usuario, on_delete=models.SET_DEFAULT)


class Item(models.Model):
    """
    Item da loja.
    """
    class Raridade(models.TextChoices):
        COMUM = "C"
        INCOMUM = "I"
        RARO = "R"
        EPICO = "E"
        LENDARIO = "L"

    class Tipo(models.TextChoices):
        # TODO

    id_item = models.AutoField(primary_key=True)
    nome = models.CharField(max_length=30)
    preco_rp = models.IntegerField()
    raridade = models.CharField(
            max_length=1,
            choices=Raridade.choices
    )
    data_lancamento = models.DateField(auto_now_add=True)

