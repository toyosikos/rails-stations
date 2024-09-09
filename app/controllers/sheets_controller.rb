class SheetsController < ApplicationController
    def index
        # Add your code here
        @sheets = Sheet.all
    end
end