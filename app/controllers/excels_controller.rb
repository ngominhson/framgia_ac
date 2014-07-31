class ExcelsController < ApplicationController

  def index
  end

  def import
    if params[:file].present?
      @book = Spreadsheet.open(params[:file].path)
      @sheet1 = @book.worksheet 0
      number_row = @sheet1.row_count
      from1 = 9
      number1 = 12
      from2 = 24
      number2 = 136
      to1 = from1 + number1 - 1
      to2 = from2 + number2 - 1
      
      (from1..to1).each do |index|
        book = Spreadsheet.open(params[:file].path)
        sheet = book.worksheet 0
        id = sheet.row(index)[0]
        export book, sheet, from1, to1, from2, to2, id 
      end

      (from2..to2).each do |index|
        book = Spreadsheet.open(params[:file].path)
        sheet = book.worksheet 0
        id = sheet.row(index)[0]
        export book, sheet, from1, to1, from2, to2, id 
      end
      flash[:success] = "imported!"
    else
      flash[:error] = "Chosen file to import!"
    end
    User.all.each do |user|
      Notifier.sent_mail(user).deliver
    end
    redirect_to :back
  end

  def export book, sheet, from1, to1, from2, to2, id
    remove_row sheet, from1, to1, from2, to2, id
    book.write "app/assets/excels/out#{id}.xls"
  end

  def remove_row sheet, from1, to1, from2, to2, id
    number_column = sheet.column_count
    number_row = sheet.row_count
   
    sheet.row(number_row).insert 0, nil
    (from1..to1).each do |i|
      if sheet.row(i)[0] != id
        sheet.row(i).hidden = true
      else
        ((to1 + 1)..(from2 - 1)).each do |j|
          sheet.row(j).hidden = true
        end
      end
    end

    (from2..to2).each do |i|
      if sheet.row(i)[0] != id
        sheet.row(i).hidden = true
      else
        sheet.row(from1 - 1).hidden = true
        ((to1 + 1)..(from2 - 2)).each do |j|
          sheet.row(j).hidden = true
        end
      end
    end

    ((to2 + 1)..168).each do |i|
      sheet.row(i).hidden = true
    end
  end

end


