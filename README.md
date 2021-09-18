# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| name               | string  | null: false               |
| name(kana)         | string  | null: false               |
| name               | string  | null: false               |
| birth              | integer | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| image              |           | null: false                    |
| item_name          | string    | null: false                    |
| description        | text      | null: false                    |
| category           | string    | null: false                    |
| condition          | string    | null: false                    |
| delivery_fee       | string    | null: false                    |
| shipment_source    | string    | null: false                    |
| days               | integer   | null: false                    |
| price              | integer   | null: false                    |
| user_id(seller)    | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user_id(buyer)     | reference  | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone_number | integer    | null: false                    |

### Association

- belongs_to :order