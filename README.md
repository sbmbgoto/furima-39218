# README

## usersテーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| email              | string    | null: false, unique: true      |
| encrypted_password | string    | null: false                    |
| last_name          | string    | null: false                    |
| first_name         | string    | null: false                    |
| last_name_kana     | string    | null: false                    |
| first_name_kana    | string    | null: false                    |
| nick_name          | string    | null: false                    |
| birthday           | date      | null: false                    |

### Association
has_many :items
has_many :oders



## itemsテーブル
| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| name                      | string     | null: false                    |
| category_id               | integer    | null: false                    |
| condition_id              | integer    | null: false                    |
| shipping_burden_id        | integer    | null: false                    |
| prefecture_id             | integer    | null: false                    |
| introduction              | text       | null: false                    |
| expected_shipping_date_id | integer    | null: false                    |
| price                     | integer    | null: false                    |
| user                      | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :order



## ordersテーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :shipping
belongs_to :item



## shippingsテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| prefecture_id | string     | null: false                    |
| city          | string     | null: false                    |
| addresses     | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| post_code     | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association
belongs_to :order