import random
import string

def generate_random_email():
    username_length = 8
    domain = 'nopCommerce.com'  # Set the domain to 'gmail.com'

    username = ''.join(random.choices(string.ascii_letters, k=username_length))

    return f"{username}@{domain}"
