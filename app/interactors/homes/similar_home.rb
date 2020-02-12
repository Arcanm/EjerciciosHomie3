
class Homes::SimilarHome
  include Interactor

  def call
    owner_id = Owner.pluck(:id)
    context.coincidences_of_home = []
    similar_homes_list = []
    owner_id.map do |id_owner|
      owner = Owner.find(id_owner)
      homes_of_owner = Home.where(owner: id_owner, home_master_id: nil, _status: 'published').pluck(:id)
      next if homes_of_owner.length == 1

      homes_of_owner.each_with_index do |id_home, index|
        next unless index + 1 != homes_of_owner.length

        first_home = Home.find(id: id_home)
        similar_homes_list = []
        (index + 1..homes_of_owner.length - 1).map do |index_second_home|
          id_next_home = homes_of_owner[index_second_home]
          second_home = Home.find(id: id_next_home)
          next unless first_home.total_amount == second_home.total_amount
          next unless first_home.location == second_home.location

          if similar_homes_list.include?(first_home)
            next if similar_homes_list.include?(second_home)

            similar_homes_list.push(second_home)
          else
            similar_homes_list.push(first_home)
            similar_homes_list.push(second_home)
            context.coincidences_of_home.push(add_similar_home(owner, first_home, id_home))
          end
          context.coincidences_of_home.push(add_similar_home(owner, second_home, id_next_home))
        end
      end
    end
    print_similar_homes(context.coincidences_of_home)
  end

  private

  def print_similar_homes(coincidences_of_home)
    context.coincidences_of_home = coincidences_of_home.uniq
    context.coincidences_of_home.map do |info|
      puts "#{info[:name]} #{info[:lastname]}, #{info[:email]}, #{info[:id_home]}, #{info[:price]}, #{info[:status]}, #{info[:location]}"
    end
  end

  def add_similar_home(owner, home, id)
    {
      name: owner.user.name,
      lastname: owner.user.last_name,
      email: owner.user.email,
      id_home: id,
      price: home.total_amount,
      status: home.status,
      location: home.location
    }
  end
end
