module GradesHelper
    
    def findgrade(user_id, module_id)
        fgrades = Grade.where("user_id = ? AND module_course_id = ? ", user_id, module_id) 
        if fgrades
            @fgrade = fgrades.first
            @fgrade
        else
            nil
        end
    end
    
    def validatesemester?(user_id)
        @overall = " - "
        fgrades = Grade.where("user_id = ?", user_id)
        if fgrades.size >= 3
            fgrades = fgrades.sort_by{ |g| g.grade }.reverse
            if fgrades[0].grade >= 40.0 and fgrades[1].grade >= 40.0 and fgrades[2].grade >= 40.0
                avg = (fgrades[0].grade + fgrades[1].grade + fgrades[2].grade) / 3.0
                if avg >= 70.0
                    @overall = "Distinction"
                elsif avg >= 60.0
                    @overall = "Merit upper division"
                elsif avg >= 50.0
                    @overall = "Merit lower division"
                elsif avg >= 40.0
                    @overall = "Pass"
                else
                    @overall = "Fail"
                end
                if avg > 40.0
                    true
                else
                    false
                end
            elsif fgrades[0].grade >= 40.0 and fgrades[1].grade >= 40.0 and fgrades[2].grade >= 35.0
                a = fgrades[0].grade - 40.0
                b = fgrades[1].grade - 40.0
                c = fgrades[2].grade - 30.0
                avg = (fgrades[0].grade + fgrades[1].grade + fgrades[2].grade) / 3.0
                if avg >= 70.0
                    @overall = "Distinction"
                elsif avg >= 60.0
                    @overall = "Merit upper division"
                elsif avg >= 50.0
                    @overall = "Merit lower division"
                elsif avg >= 40.0
                    @overall = "Pass"
                else
                    @overall = "Fail"
                end
                if (a + b) > (2 * c)
                     true
                else
                    false
                end
            else
                @overall = "Fail"
                false
            end
        else
            false
        end
    end

end
