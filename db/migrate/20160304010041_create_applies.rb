class CreateApplies < ActiveRecord::Migration
  def change
    create_table :applies do |t|
      
      #지원번호, 이름, 학번, 학과, 이메일, 전화번호, 성별, 나이, 지원서파일, 비고, 평가완료회수
      t.integer :apply_num
      t.string  :name
      t.string  :student_id
      t.string  :major
      t.string  :email
      t.string  :phonenumber
      t.string  :sex
      t.string  :age
      t.string  :file
      t.string  :file2
      t.string  :etc
      t.integer :rated

      t.timestamps null: false
    end
  end
end
