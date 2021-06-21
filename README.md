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

- has_many :items
- has_many :buyers

## itemsテーブル

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
- has_one :buyer

## buyersテーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :order

## ordersテーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city_name     | string     | null: false       |
| house_num     | string     | null: false       |
| building_name | string     |                   |
| phone_num     | string     | null: false       |
| buyer         | references | foreign_key: true |

### Association

- belongs_to :buyer