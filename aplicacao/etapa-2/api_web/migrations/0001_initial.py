# Generated by Django 4.2.2 on 2023-09-27 02:06

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):
    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name="Carrinho",
            fields=[
                ("id_carrinho", models.AutoField(primary_key=True, serialize=False)),
            ],
        ),
        migrations.CreateModel(
            name="Item",
            fields=[
                ("id_item", models.AutoField(primary_key=True, serialize=False)),
                ("nome", models.CharField(max_length=30, unique=True)),
                ("preco_rp", models.IntegerField()),
                (
                    "raridade",
                    models.CharField(
                        choices=[
                            ("COMUM", "Comum"),
                            ("INCOMUM", "Incomum"),
                            ("RARO", "Raro"),
                            ("EPICO", "Epico"),
                            ("LENDARIO", "Lendario"),
                        ],
                        max_length=20,
                    ),
                ),
                ("data_lancamento", models.DateField(auto_now_add=True)),
                (
                    "tipo",
                    models.CharField(
                        choices=[
                            ("CAMPEAO", "Campeao"),
                            ("SKIN", "Skin"),
                            ("CROMA", "Croma"),
                            ("SKIN SENTINELA", "Skin Sentinela"),
                            ("EMOTE", "Emote"),
                            ("ICONE", "Icone"),
                        ],
                        max_length=20,
                    ),
                ),
                (
                    "desconto",
                    models.DecimalField(decimal_places=2, default=1, max_digits=4),
                ),
                (
                    "preco_final",
                    models.DecimalField(
                        blank=True, decimal_places=2, max_digits=10, null=True
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Usuario",
            fields=[
                (
                    "email_primario",
                    models.EmailField(max_length=30, primary_key=True, serialize=False),
                ),
                ("nome", models.CharField(max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name="ItemCarrinho",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "status",
                    models.CharField(
                        choices=[
                            ("COMPRADO", "Comprado"),
                            ("CANCELADO", "Cancelado"),
                            ("A REEMBOLSAR", "A Reembolsar"),
                            ("REEMBOLSADO", "Reembolsado"),
                        ],
                        max_length=30,
                    ),
                ),
                ("data_adicao", models.DateField(auto_now_add=True)),
                (
                    "id_carrinho",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="api_web.carrinho",
                    ),
                ),
                (
                    "id_item",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE, to="api_web.item"
                    ),
                ),
            ],
        ),
        migrations.AddField(
            model_name="carrinho",
            name="email_usuario",
            field=models.ForeignKey(
                on_delete=models.SET("deletado"), to="api_web.usuario"
            ),
        ),
    ]
