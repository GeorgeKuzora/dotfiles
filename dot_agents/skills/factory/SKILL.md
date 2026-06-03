---
name: factory
description: Generate test fixtures and mock data using factory_boy and Faker libraries. Use for creating realistic test objects, database fixtures, and mock data in Python tests with minimal boilerplate.
---

# Python Factory Boy + Faker Skill

Generate realistic test data and fixtures using `factory_boy` with `Faker` integration. This skill helps create maintainable, DRY test factories for any Python object or ORM model.

## When to Use This Skill

- Creating test fixtures for unit/integration tests
- Generating mock data for development/staging environments
- Building realistic test scenarios with complex object relationships
- Replacing static, hard-to-maintain fixture files
- Creating anonymized data from production schemas

## Setup

Install dependencies:

```bash
pip install factory_boy Faker
```

Optional: Add to your test requirements:

```txt
# requirements-test.txt
factory_boy>=3.3.0
Faker>=4.0.0
pytest>=7.0.0
```

## Core Concepts

### 1. Basic Factory Definition

```python
import factory
from myapp.models import User

class UserFactory(factory.Factory):
    class Meta:
        model = User  # Target class/ORM model

    # Static attributes
    first_name = 'John'
    last_name = 'Doe'
    is_active = True

    # Dynamic: Faker integration for realistic data
    email = factory.Faker('email')
    phone = factory.Faker('phone_number')

    # Dynamic: Computed from other attributes
    full_name = factory.LazyAttribute(
        lambda obj: f"{obj.first_name} {obj.last_name}"
    )

    # Dynamic: Function called at instantiation
    date_joined = factory.LazyFunction(datetime.datetime.now)

    # Unique sequential values
    username = factory.Sequence(lambda n: f'user{n:04d}')
```

### 2. Instantiation Strategies

```python
# Build: returns unsaved instance (no DB call)
user = UserFactory.build()

# Create: returns saved instance (calls .save() for ORM)
user = UserFactory.create()

# Stub: returns simple object with attributes only
user = UserFactory.stub()

# Default call = create()
user = UserFactory()

# Override attributes at call time
user = UserFactory(first_name='Jane', email='jane@example.com')

# Batch creation
users = UserFactory.create_batch(5)
users = UserFactory.build_batch(10, is_active=True)
```

### 3. Faker Integration Patterns

```python
class ProfileFactory(factory.Factory):
    class Meta:
        model = Profile

    # Basic Faker providers
    bio = factory.Faker('text', max_nb_chars=200)
    city = factory.Faker('city')
    country = factory.Faker('country_code')

    # Faker with arguments
    company = factory.Faker('company', max_nb_chars=30)
    job_title = factory.Faker('job')

    # Localized Faker data
    # factory.Faker('first_name', locale='ru_RU')

    # Multiple Faker calls for variety
    tags = factory.LazyFunction(
        lambda: [factory.Faker('word').generate({}) for _ in range(3)]
    )
```

### 4. Relationships & SubFactories

```python
class PostFactory(factory.Factory):
    class Meta:
        model = Post

    # Link to another factory
    author = factory.SubFactory(UserFactory)

    # Override nested attributes using double underscore
    author__is_active = True
    author__email = factory.Faker('company_email')

    # Many-to-many or list relationships
    @factory.post_generation
    def tags(self, create, extracted, **kwargs):
        if not create:
            return
        if extracted:
            for tag in extracted:
                self.tags.add(tag)
```

### 5. Advanced Patterns

#### Conditional Attributes
```python
class OrderFactory(factory.Factory):
    class Meta:
        model = Order

    status = factory.Iterator(['draft', 'pending', 'paid', 'shipped'])

    # LazyAttribute with conditional logic
    shipped_at = factory.LazyAttribute(
        lambda obj: datetime.datetime.now() if obj.status == 'shipped' else None
    )
```

#### Trait-like Factories (Inheritance)
```python
class VerifiedUserFactory(UserFactory):
    email_verified = True
    verification_sent_at = factory.LazyFunction(datetime.datetime.now)

class PremiumUserFactory(UserFactory):
    subscription_tier = 'premium'
    premium_since = factory.LazyFunction(datetime.datetime.now)
```

#### Custom Parameters with post_generation
```python
class UserFactory(factory.Factory):
    class Meta:
        model = User

    @factory.post_generation
    def permissions(self, create, extracted, **kwargs):
        """Add permissions: UserFactory(permissions=['read', 'write'])"""
        if not create:
            return
        if extracted:
            for perm in extracted:
                self.permissions.add(perm)
```

## Usage Examples

### Unit Test Example
```python
import unittest
from myapp.factories import UserFactory, PostFactory

class TestUserService(unittest.TestCase):

    def test_create_post_for_user(self):
        user = UserFactory(is_active=True)
        post = PostFactory(author=user, title='Test Post')

        self.assertEqual(post.author, user)
        self.assertTrue(user.is_active)
```

### pytest Fixture Integration
```python
# conftest.py
import pytest
from myapp.factories import UserFactory

@pytest.fixture
def active_user(db):
    """Create an active user with Faker-generated data"""
    return UserFactory(is_active=True)

@pytest.fixture
def user_batch(db):
    """Create 5 users for batch testing"""
    return UserFactory.create_batch(5)

# test_users.py
def test_user_list(client, user_batch):
    response = client.get('/api/users')
    assert response.status_code == 200
    assert len(response.json()) == 5
```

### Complex Scenario: E-commerce
```python
class OrderFactory(factory.Factory):
    class Meta:
        model = Order

    order_number = factory.Sequence(lambda n: f'ORD-{n:06d}')
    customer = factory.SubFactory('myapp.factories.CustomerFactory')
    total_amount = factory.Faker('pydecimal', left_digits=4, right_digits=2, positive=True)
    currency = factory.Faker('currency_code')
    status = factory.Iterator(['pending', 'processing', 'shipped', 'delivered'])
    created_at = factory.Faker('date_time_between', start_date='-1y', end_date='now')

    @factory.post_generation
    def items(self, create, extracted, **kwargs):
        if not create or not extracted:
            return
        for item_data in extracted:
            OrderItemFactory(order=self, **item_data)

# Usage:
order = OrderFactory(
    status='shipped',
    items=[
        {'product_name': 'Widget', 'quantity': 2, 'unit_price': 19.99},
        {'product_name': 'Gadget', 'quantity': 1, 'unit_price': 49.99},
    ]
)
```

## Faker Provider Reference

Commonly used Faker providers for test data:

| Category | Provider Example | Output |
|----------|-----------------|--------|
| Personal | `Faker('name')` | "Jane Smith" |
| Contact | `Faker('email')` | "user@example.com" |
| Address | `Faker('address')` | "123 Main St..." |
| Company | `Faker('company')` | "Acme Corp" |
| Internet | `Faker('ipv4')` | "192.168.1.1" |
| Date/Time | `Faker('date_time_between')` | datetime object |
| Text | `Faker('sentence')` | "Lorem ipsum..." |
| Numbers | `Faker('pyint', min=1, max=100)` | 42 |
| Finance | `Faker('currency_code')` | "USD" |

Full provider list: https://faker.readthedocs.io/en/master/providers.html

## Best Practices

✅ **Do:**
- Use `factory.Faker()` for realistic, varied test data
- Override attributes at call time for test-specific values
- Use `SubFactory` for related objects to maintain consistency
- Seed Faker for reproducible tests: `Faker.seed(42)`
- Create trait-like factories for common variants (VerifiedUserFactory)

❌ **Avoid:**
- Hardcoding values that Faker can generate dynamically
- Creating factories that always hit the database in unit tests (use `.build()`)
- Overusing `.create()` when `.build()` suffices for logic tests
- Forgetting to handle `create=False` in `@post_generation` hooks

## Troubleshooting

### "AttributeError: 'Meta' object has no attribute 'model'"
Ensure your factory has the correct Meta class:
```python
class MyFactory(factory.Factory):
    class Meta:
        model = MyModel  # Must be the actual class, not a string (unless using django)
```

### Faker generating same values
Faker uses a shared random state. Seed it for reproducibility:
```python
from faker import Faker
Faker.seed(1234)  # Call once before tests
```

## Quick Commands

```bash
# Generate a single test user
python -c "from myapp.factories import UserFactory; print(UserFactory().email)"

# Generate fixture data
python -c "
from myapp.factories import ProfileFactory
import json
data = [p.__dict__ for p in ProfileFactory.create_batch(10)]
print(json.dumps(data, indent=2, default=str))
" > fixtures/test_profiles.json

# Reset Faker sequence for reproducible tests
python -c "from faker import Faker; Faker.seed(42)"
```
