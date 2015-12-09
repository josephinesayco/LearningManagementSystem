class HomeController < ApplicationController

  before_filter :authenticate_user!

  def index

    @user = current_user


    #status = current_user.is_passed.nil? ? current_user.status_passed? : current_user.is_passed
    # data

    if @user.is_passed.nil?
      status = @user.status_passed?
      @user.update_attribute(:is_passed, status)
    else
      status = current_user.is_passed
    end



    # if user.prog_2 <= 2.25
    #     if user.schedule == "am" || user.schedule == "pm"
    #       if user.prog_3 <= 1.75
    #         status = "passed"
    #       end

    #       if user.prog_3 > 1.75
    #         if user.prog_2 <= 1.753
    #           if user.prog_1 <= 2.5
    #             status = "passed"
    #           end
    #           if user.prog_1 > 2.5
    #             if user.age <= 18
    #               status = "passed"
    #             end

    #             if user.age > 18
    #               if user.prog_1 <= 3
    #                 status = "passed"
    #               end

    #               if user.prog_1 > 3
    #                 status = "failed"
    #               end
    #             end

    #           end

    #         end

    #         if user.prog_2 > 1.753
    #           if user.prog_1 <= 2
    #             if user.schedule == "am"
    #               status = "passed"
    #             else
    #               if user.age <= 19
    #                 if user.gender == "Female"
    #                   status = "passed"
    #                 else
    #                   status = "failed"
    #                 end
    #               else
    #                 status = "passed"
    #               end
    #             end
    #           end

    #           if user.prog_1 > 2
    #             if user.prog_2 <= 2
    #               if user.prog_3 <= 2.75
    #                 if user.schedule == "am"
    #                   status = "passed"
    #                 else
    #                   status = "failed"
    #                 end
    #               end

    #               if user.prog_3 > 2.75
    #                 status = "failed"
    #               end
    #             end

    #             if user.prog_2 > 2
    #               status = "failed"
    #             end
    #           end
    #         end
    #       end
    #     end

    #     if user.schedule == "night"
    #       if user.prog_3 <= 2.25
    #         # Not prog 2???
    #         if user.prog_3 <= 1.5
    #           status = "passed"
    #         else

    #           if user.age <= 18
    #             status = "passed"
    #           else
    #             if user.prog_1 <= 1.753
    #               status = "passed"
    #             else
    #               if user.prog_2 <= 1.75
    #                 status = "passed"
    #               else
    #                 status = "failed"
    #               end
    #             end
    #           end

    #         end
    #       end

    #       if user.prog_3 > 2.25
    #         if user.prog_2 <= 1.753
    #           # prog 2 again?
    #           if user.prog_2 <= 1.253
    #             status = "passed"
    #           else
    #             status = "failed"
    #           end
    #         else
    #           status = "failed"
    #         end
    #       end
    #     end
    # else#prog_2 > 2.25
    #   if user.prog_3 <= 1.75
    #     if user.prog_1 <= 2.25
    #       status = "passed"
    #     else
    #       if user.prog_1 <= 3
    #         status = "passed"
    #       else
    #         status = "failed"
    #       end
    #     end
    #   else
    #     if user.prog_1 <= 2
    #       if user.prog_3 <= 2.25
    #         status = "passed"
    #       else
    #         status = "failed"
    #       end
    #     else
    #       status = "failed"
    #     end
    #   end
    # end

    @passed = status
  end
end
