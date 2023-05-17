# README

## usersテーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| email              | string    | null: false, unique: true      |
| ncrypted_password  | string    | null: false                    |
| name               | string    | null: false                    |
| name_kana          | string    | null: false                    |
| nick_name          | string    | null: false                    |
| birthday           | integer   | null: false                    |
| oder               | reference | null: false, foreign_key: true |
| item               | reference | null: false, foreign_key: true |
| shipping           | reference | null: false, foreign_key: true |

### Association
has_many :items
has_many :oders
has_many :shippings



## itemsテーブル
| Column                 | Type      | Options                        |
| ---------------------- | --------- | ------------------------------ |
| name                   | string    | null: false                    |
| image                  | string    | null: false                    |
| Category               | string    | null: false                    |
| condition              | string    | null: false                    |
| shipping_burden        | string    | null: false                    |
| place_of_shipment      | string    | null: false                    |
| introduction           | text      | null: false                    |
| expected_shipping_date | integer   | null: false                    |
| user                   | reference | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :oder



## odersテーブル
| Column    | Type      | Options                        |
| --------- | --------- | ------------------------------ |
| user      | reference | null: false, foreign_key: true |
| items     | reference | null: false, foreign_key: true |
| shippings | reference | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :shipping
has_one :item



## shippingsテーブル
| Column       | Type      | Options                        |
| ------------ | --------- | ------------------------------ |
| prefectures  | string    | null: false                    |
| city         | string    | null: false                    |
| addresses    | string    | null: false                    |
| building     | string    |                                |
| phone number | integer   | null: false                    |
| post code    | integer   | null: false                    |
| user         | reference | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :oder