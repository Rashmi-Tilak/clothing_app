# Generated by Django 4.2.3 on 2023-07-27 11:28

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('cloth_app', '0007_orderitem_order_item_price'),
    ]

    operations = [
        migrations.AddField(
            model_name='orderitem',
            name='product',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='cloth_app.product'),
            preserve_default=False,
        ),
    ]
