class ApplicationController < ActionController::Base
	include SessionsHelper
	def caesar_cipher(letter, number)
		ascii_index = letter.ord + number		
		letter == letter.upcase && ascii_index > 90 || letter.downcase && ascii_index > 122 ? ascii_index -= 26 : ascii_index = ascii_index 
		return ascii_index.chr
	end

	def caesar_cipher_symbols (letter, number)
		return letter = letter.ord < 65 || letter.ord > 122 ? letter = letter : letter = caesar_cipher(letter, number)
	end

	def encrypt_this_string(string, number)
		return splitted_string = string.split(//).map!{|letter| caesar_cipher_symbols(letter, number)}.join
	end
end