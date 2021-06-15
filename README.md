## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_kanji         | string | null: false |
| first_kanji        | string | null: false |
| last_kana          | string | null: false |
| first_kana         | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :products
- has_many :buys
- has_many :addresses

## productsテーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| title         | string     | null: false |
| description   | text       | null: false |
| category      | string     | null: false |
| status        | string     | null: false |
| delivery_fee  | integer    | null: false |
| shipping_area | string     | null: false |
| days_of_ship  | integer    | null: false |
| price         | integer    | null: false |
| user          | references |             |

### Association

- belongs_to :user
- has_many :buys

## buysテーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| user    | references |             |
| product | references |             |

### Association

- belongs_to :user
- belongs_to :product

## addressesテーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal_code   | string     | null: false |
| prefecture    | string     | null: false |
| city_name     | string     | null: false |
| house_num     | string     | null: false |
| building_name | string     |             |
| phone_num     | integer    | null: false |
| user          | references |             |

### Association

- belongs_to :user