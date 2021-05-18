   ## usersテーブル
| Column         | Type               | Options                         |
| -------------- | -----------------  | ------------------------------- |
| nickname       | string             | null: false, unique: true       |
| email          | string             | null: false, unique: true       |
| password       | encrypted_password | null: false                     |
| last_name      | string             | null: false                     |
| first_name     | string             | null: false                     |
| last_name_kana | string             | null: false                     |
| first_name_kana| string             | null: false                     |
| birthday       | date               | null: false                     |

### Association
has_many :items
has_many :orders

   
   ## itemsテーブル
| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| title              | string     | null: false                     |
| price              | integer    | null: false                     |
| user               | references | null: false, foreign_key: true  |
| category           | string     | null: false                     |
| condition_id       | integer    | null: false                     |
|delivery_option1_id | integer    | null: false                     |
|delivery_option2_id | integer    | null: false                     |
| delivery_from_id   | integer    | null: false                     |

### Association
belongs_to :user
has_one :order

   
   ## addressesテーブル
| Column         | Type           | Options                         |
| -------------- | -------------- | ------------------------------- |
| order          | references     | null: false, foreign_key: true  |
| postal_code    | string         | null: false                     |
| prefecture_id  | integer        | null: false                     |
| address1       | string         | null: false                     |
| address2       | string         | null: false                     |
| building       | string         |                                 |
| phone_number   | string         | null: false                     |

### Association
belongs_to :order
has_many :items
has_many :orders

   
   ## ordersテーブル
| Column         | Type       | Options                         |
| -------------- | ---------- | ------------------------------- |
| user           | references | null: false, foreign_key: true  |
| item           | references | null: false, foreign_key: true  |

### Association
belongs_to :user
belongs_to :item
has_one    :address




