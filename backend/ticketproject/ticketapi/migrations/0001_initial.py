# Generated by Django 4.0.4 on 2022-08-21 04:59

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Ticket',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.TextField(max_length=255)),
                ('description', models.TextField(max_length=255)),
                ('open_date', models.DateTimeField(auto_now_add=True)),
                ('close_date', models.DateTimeField(blank=True, null=True)),
                ('status', models.TextField(max_length=12)),
            ],
        ),
    ]
