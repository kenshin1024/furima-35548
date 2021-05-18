   ## usersテーブル
| Column         | Type   | Options                         |
| -------------- | ------ | ------------------------------- |
| nickname       | string | null: false, unique: true       |
| email          | string | null: false, unique: true       |
| password       | string | null: false                     |
| last_name      | string | null: false                     |
| first_name     | string | null: false                     |
| last_name_kana | string | null: false                     |
| first_name_kana| string | null: false                     |
| birthday       | date   | null: false                     |

### Association
has_many :items
has_many :addresses
has_many :orders

   
   ## itemsテーブル
| Column          | Type       | Options                         |
| --------------  | ---------- | ------------------------------- |
| title           | string     | null: false                     |
| image           | string     | null: false                     |
| price           | integer    | null: false                     |
| user            | references | null: false, foreign_key: true  |
| address         | references | null: false, foreign_key: true  |
| category        | string     | null: false                     |
| condition       | string     | null: false                     |
|delivery_option1 | string     | null: false                     |
|delivery_option2 | string     | null: false                     |
| delivery_from   | string     | null: false                     |

### Association
belongs_to :user
belongs_to :address
has_one :order

   
   ## addressesテーブル
| Column         | Type       | Options                         |
| -------------- | ---------- | ------------------------------- |
| user           | references | null: false, foreign_key: true  |
| postal_code    | integer    | null: false                     |
| prefecture     | string     | null: false                     |
| address1       | string     | null: false                     |
| address2       | string     | null: false                     |
| building       | string     |                                 |
| phone_number   | integer    | null: false                     |

### Association
belongs_to :user
has_many :items
has_many :orders

   
   ## ordersテーブル
| Column         | Type       | Options                         |
| -------------- | ---------- | ------------------------------- |
| user           | references | null: false, foreign_key: true  |
| item           | references | null: false, foreign_key: true  |
| address        | references | null: false, foreign_key: true  |

### Association
belongs_to :user
belongs_to :item
belongs_to :address





