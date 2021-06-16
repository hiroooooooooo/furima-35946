## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_kanji         | string | null: false               |
| first_kanji        | string | null: false               |
| last_kana          | string | null: false               |
| first_kana         | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :products
- has_many :buys

## productsテーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| title           | string     | null: false       |
| description     | text       | null: false       |
| category_id     | integer    | null: false       |
| status_id       | integer    | null: false       |
| delivery_fee_id | integer    | null: false       |
| prefecture_id   | integer    | null: false       |
| days_of_ship_id | integer    | null: false       |
| price           | integer    | null: false       |
| user            | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buysテーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| product | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :address

## addressesテーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city_name     | string     | null: false       |
| house_num     | string     | null: false       |
| building_name | string     |                   |
| phone_num     | string     | null: false       |
| buy           | references | foreign_key: true |

### Association

- belongs_to :buy