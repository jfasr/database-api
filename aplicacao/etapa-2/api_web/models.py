from django.db import models


class Usuario(models.Model):
    """
    Um usuário que realiza compras.
    """
    email_primario = models.EmailField(primary_key=True, max_length=30)
    nome = models.CharField(max_length=30)
    riot_points = models.IntegerField


class Carrinho(models.Model):
    """
    Carrinho de compras de um usuário.
    """
    id_carrinho = models.AutoField(primary_key=True)
    email_usuario = models.ForeignKey(Usuario, on_delete=models.SET("deletado"))

class Item(models.Model):
    """
    Item da loja.
    """
    class Raridade(models.TextChoices):
        COMUM = "COMUM"
        INCOMUM = "INCOMUM"
        RARO = "RARO"
        EPICO = "EPICO"
        LENDARIO = "LENDARIO"

    class Tipo(models.TextChoices):
        CAMPEAO = "CAMPEAO"
        SKIN = "SKIN"
        CROMA = "CROMA"
        SKIN_SENTINELA = "SKIN SENTINELA"
        EMOTE = "EMOTE"
        ICONE = "ICONE"

    id_item = models.AutoField(primary_key=True)
    nome = models.CharField(max_length=30, null=False, unique=True)
    preco_rp = models.IntegerField(null=False)
    raridade = models.CharField(
            max_length=20,
            choices=Raridade.choices,
            null=False
    )
    data_lancamento = models.DateField(auto_now_add=True)
    tipo = models.CharField(
            max_length=20,
            choices=Tipo.choices,
            null=False
    )
    desconto = models.DecimalField(
            default=1,
            null=False,
            max_digits=4,
            decimal_places=2
    )
    preco_final = models.DecimalField(
            max_digits=10,
            decimal_places=2,
            blank=True,
            null=True
    )

    def save(self, *args, **kwargs):
        # need to override save method for fields generated from other fields
        self.preco_final = self.preco_rp * (1 - self.desconto / 100 )
        # call the "real" save method
        super(Item, self).save(*args, **kwargs)

class ItemCarrinho(models.Model):
    """
    Representa a presença de um item num carrinho.
    """
    class Status(models.TextChoices):
        COMPRADO = "COMPRADO"
        CANCELADO = "CANCELADO"
        A_REEMBOLSAR = "A REEMBOLSAR"
        REEMBOLSADO = "REEMBOLSADO"

    status = models.CharField(
            max_length=30,
            choices=Status.choices,
            null=False
    )
    id_carrinho = models.ForeignKey(Carrinho, on_delete=models.CASCADE)
    id_item = models.ForeignKey(Item, on_delete=models.CASCADE)
    data_adicao = models.DateField(auto_now_add=True)

