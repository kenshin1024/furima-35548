   ## usersテーブル
| Column                   | Type               | Options                         |
| ------------------------ | -----------------  | ------------------------------- |
| nickname                 | string             | null: false      |
| email                    | string             | null: false, unique: true       |
| encrypted_password       | string             | null: false                     |
| last_name                | string             | null: false                     |
| first_name               | string             | null: false                     |
| last_name_kana           | string             | null: false                     |
| first_name_kana          | string             | null: false                     |
| birthday                 | date               | null: false                     |

### Association
has_many :items
has_many :orders

   
   ## itemsテーブル
| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| title              | string     | null: false                     |
| price              | integer    | null: false                     |
| user               | references | null: false, foreign_key: true  |
| category_id        | integer    | null: false                     |
| condition_id       | integer    | null: false                     |
| delivery_fee       | integer    | null: false                     |
|scheduled_delivery  | integer    | null: false                     |
| prefecture_id      | integer    | null: false                     |
| description        | text       | null: false                     |

### Association
belongs_to :user
has_one :order

   
   ## addressesテーブル
| Column            | Type           | Options                         |
| ----------------- | -------------- | ------------------------------- |
| order             | references     | null: false, foreign_key: true  |
| postal_code       | string         | null: false                     |
| prefecture_id     | integer        | null: false                     |
| city              | string         | null: false                     |
| address           | string         | null: false                     |
| building          | string         |                                 |
| phone_number      | string         | null: false                     |

### Association
belongs_to :order


   
   ## ordersテーブル
| Column         | Type       | Options                         |
| -------------- | ---------- | ------------------------------- |
| user           | references | null: false, foreign_key: true  |
| item           | references | null: false, foreign_key: true  |

### Association
belongs_to :user
belongs_to :item
has_one    :address




