# frozen_string_literal: true

class NotesController < ApplicationController
  def index
    @notes = current_user.notes.order position: :asc
  end

  def new
    @note = current_user.notes.build
    @note.position = current_user.notes.count + 1
  end

  def create
    @note = current_user.notes.build note_params
    if @note.save
      flash.now[:success] = 'Note created!'
    else
      render :new
    end
  end

  def edit
    @note = current_user.notes.find params[:id]
  end

  def update
    @note = current_user.notes.find params[:id]
    if @note.update note_params
      flash.now[:success] = 'Note updated!'
    else
      render :edit
    end
  end

  def reorder
    @note = current_user.notes.find_by position: params[:old_position]
    @note.insert_at params[:new_position]

    head :ok
  end

  private

  def note_params
    params.require(:note).permit(:title, :description, :position)
  end
end
