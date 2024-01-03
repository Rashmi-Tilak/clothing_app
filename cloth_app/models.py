from django.db import models

from io import BytesIO
from django.core.files import File
from PIL import Image,ImageDraw
from django.core.validators import MaxValueValidator
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from django.db import models
from cloudinary.models import CloudinaryField
from .manager import CustomUserManager
from django.contrib.auth.models import User, AbstractUser
from django.conf import settings
from urllib.parse import urlencode
from django.contrib.auth.models import User
from rest_framework.authtoken.models import Token
import secrets

class CustomUser(AbstractUser, PermissionsMixin):
    phone_number = models.CharField(max_length=20, blank=True)
    is_verified = models.BooleanField(default=False)
    username = models.CharField(max_length=150, unique=True, null=True, blank=False)
    password = models.CharField(max_length=100, null=False, blank=False)
    email = models.EmailField(unique=True, blank=False)
    address = models.TextField(max_length=250, blank=False)
    otp = models.CharField(max_length=20, blank=True, null=True)
    is_logged_in = models.BooleanField(default=False)
    display_picture = CloudinaryField('Display Picture', null=True, blank=True)
    objects = CustomUserManager()

    # Use 'phone_number' as the unique identifier for authentication
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username','phone_number']

    class Meta:
        db_table = 'CustomUser'

class Categories(models.Model):
    GENDER_CHOICES = (
        ('M', 'Men'),
        ('W', 'Women'),
        ('K', 'Kids'),
    )
    categoryName = models.CharField(max_length=255)
    category_img = CloudinaryField(blank=True)
    subcategories = models.ManyToManyField('Subcategory', blank=True, related_name='Subcategory_detail')
    gender = models.CharField(max_length=1, choices=GENDER_CHOICES, default='K')

    def __str__(self):
        return self.categoryName

    class Meta:
        managed = True
        db_table = 'categories'


class Subcategory(models.Model):
    category = models.ForeignKey(Categories, on_delete=models.CASCADE)
    subcategoryName = models.CharField(max_length=255)
    sub_category_img = CloudinaryField(blank=True)

    def __str__(self):
        return self.subcategoryName

    class Meta:
        managed = True
        db_table = 'subcategories'


class Product(models.Model):
    GENDER_CHOICES = (
        ('G', 'Girls'),
        ('B', 'Boys'),
        ('K', 'Kids'),
    )
    name = models.CharField(max_length=200)
    category = models.ForeignKey(Categories, on_delete=models.CASCADE)
    subcategoryName = models.ForeignKey(Subcategory, on_delete=models.CASCADE, default=None)
    description = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    images = models.ManyToManyField('ProductImage', blank=True, related_name='products_with_images')
    variants = models.ManyToManyField('ProductVariant', blank=True, related_name='products_with_variants')
    gender = models.CharField(max_length=1, choices=GENDER_CHOICES, default='G')  # Default to 'Girls'
    offer = models.DecimalField(max_digits=5, decimal_places=2, null=True, blank=True,
                                help_text="Discount percentage for the offer")

    def __str__(self):
        return self.name

    class Meta:
        managed = True
        db_table = 'product'

class ProductVariant(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    size_choices = (
        ('S', 'Small'),
        ('M', 'Medium'),
        ('L', 'Large'),
        ('XL', 'Extra Large'),
    )
    size = models.CharField(max_length=2, choices=size_choices)
    # color = models.CharField(max_length=50)
    quantity = models.IntegerField(null=True, blank=False, default=1)

    def __str__(self):
        return f"{self.product.name} - Size: {self.get_size_display()}"

    class Meta:
        managed = True
        db_table = 'product_variant'

class ProductImage(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    image =CloudinaryField(blank=True)

    def __str__(self):
        return f"Image for {self.product.name}"

    class Meta:
        db_table = 'product_image'





class Inventory(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    in_stock = models.PositiveIntegerField(default=0)
    out_stock = models.PositiveIntegerField(default=0)

    def __str__(self):
        return f"Inventory for {self.product.name}"

    class Meta:
        managed = True
        db_table = 'inventory'

class Order(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    ordered_date = models.DateTimeField(auto_now_add=True)
    is_ordered = models.BooleanField(default=False)
    total_price = models.IntegerField(null=False, blank=False)
    ORDER_STATUS_CHOICES = (
        ('PENDING', 'Pending'),
        ('PROCESSING', 'Processing'),
        ('COMPLETED', 'Completed'),
        ('CANCELLED', 'Cancelled'),
    )
    status = models.CharField(
        max_length=20,
        choices=ORDER_STATUS_CHOICES,
        default='PENDING'
    )

    def __str__(self):
        return f"Order #{self.id} - CustomUser: {self.user.username}"

    class Meta:
        managed = True
        db_table = 'order'


class Cart(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    product_variant = models.ForeignKey(ProductVariant, on_delete=models.CASCADE)
    quantity = models.IntegerField(null=True, blank=False, default=1)
    orderid = models.ForeignKey(Order, on_delete=models.CASCADE, null=True, blank=True)
    cart_created = models.BooleanField(default=False)

    class Meta:
        managed = True
        db_table = 'cart'

class WishList(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    add_to_cart =  models.BooleanField(default=False)


    class Meta:
        managed = True
        db_table = 'wishlist'



class OrderItem(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    product_variant = models.ForeignKey(ProductVariant, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=1)
    order_item_price = models.IntegerField(default=0)

    def __str__(self):
        return f"{self.quantity} x {self.product_variant.product.name} - Size: {self.product_variant.get_size_display()}"

    class Meta:
        managed = True
        db_table = 'orderitem'
# Create your models here.
