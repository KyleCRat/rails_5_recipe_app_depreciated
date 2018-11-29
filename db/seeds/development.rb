veg_oil = FactoryBot.build(
  :step_ingredient,
  ingredient: FactoryBot.build(
    :ingredient,
    title: 'Vegetable Oil',
    description: nil
  ),
  technique: nil,
  measurements: [
    FactoryBot.build(
      :measurement,
      unit: 'tbsp',
      scalar: 1,
      purpose: nil
    )
  ]
)
veg_oil.save

FactoryBot.build(
  :recipe,
  title: 'Beef and Brocoli Pinwheels',
  description: 'Puff Pastery Pinwheels with a beef and brocoli sautè',

  steps: [
    FactoryBot.build(
      :step,
      title: 'Pre-heat oven to 400˚ F'
    ),
    FactoryBot.build(
      :step,
      title: 'Prepare the Pinwheels',
      description: 'Unfold the pastry sheet on a lightly floured surface. Cut the pastry sheet into 4 squares. Using a sharp knife, cut diagonal lines from the corners of the pastry squares to within 3/4 inch of the center. Fold every other corner to the center and press to seal. Place the pastries onto a baking sheet.',
      step_ingredients: [
        FactoryBot.build(
          :step_ingredient,
          ingredient: FactoryBot.build(
            :ingredient,
            title: 'Pepperidge Farm® Puff Pastry Sheets',
            description: nil
          ),
          technique: FactoryBot.build(
            :technique,
            title: 'Thawed',
            description: 'Thaw according to instructions'
          ),
          measurements: [
            FactoryBot.build(
              :measurement,
              unit: 'oz',
              scalar: 17.3,
              purpose: nil
            )
          ]
        )
      ]
    ),
    FactoryBot.build(
      :step,
      title: 'Create Broth Mixture',
      description: 'Stir the cornstarch, broth, soy sauce and red pepper in a medium bowl until the mixture is smooth.',
      step_ingredients: [
        FactoryBot.build(
          :step_ingredient,
          ingredient: FactoryBot.build(
            :ingredient,
            title: 'Cornstarch',
            description: nil
          ),
          technique: nil,
          measurements: [
            FactoryBot.build(
              :measurement,
              unit: 'tbsp',
              scalar: 2,
              purpose: nil
            )
          ]
        ),
        FactoryBot.build(
          :step_ingredient,
          ingredient: FactoryBot.build(
            :ingredient,
            title: 'Swanson® Beef Broth',
            description: nil
          ),
          technique: nil,
          measurements: [
            FactoryBot.build(
              :measurement,
              unit: 'cup',
              scalar: 1.75,
              purpose: nil
            )
          ]
        ),
        FactoryBot.build(
          :step_ingredient,
          ingredient: FactoryBot.build(
            :ingredient,
            title: 'Soy Sauce',
            description: nil
          ),
          technique: nil,
          measurements: [
            FactoryBot.build(
              :measurement,
              unit: 'tbsp',
              scalar: 1,
              purpose: nil
            )
          ]
        ),
        FactoryBot.build(
          :step_ingredient,
          ingredient: FactoryBot.build(
            :ingredient,
            title: 'Red Pepper Flakes',
            description: nil
          ),
          technique: nil,
          measurements: [
            FactoryBot.build(
              :measurement,
              unit: 'tsp',
              scalar: 0.5,
              purpose: nil
            )
          ]
        )
      ]
    ),
    FactoryBot.build(
      :step,
      title: 'Stir Fry the Beef',
      description: 'Heat 1 tablespoon oil in a 10-inch skillet over medium-high heat. Add the beef and stir-fry until it\'s well browned. Remove the beef from the skillet. Pour off any fat.',
      step_ingredients: [
        veg_oil,
        FactoryBot.build(
          :step_ingredient,
          ingredient: FactoryBot.build(
            :ingredient,
            title: 'Boneless Beef Siloin',
            description: nil
          ),
          technique: FactoryBot.build(
            :technique,
            title: 'Cut thin against the grain',
            description: nil
          ),
          measurements: [
            FactoryBot.build(
              :measurement,
              unit: 'lb',
              scalar: 1,
              purpose: nil
            )
          ]
        )
      ]
    ),
    FactoryBot.build(
      :step,
      title: 'Fry the vegetables',
      description: 'Heat the remaining oil in the skillet. Add the broccoli and onions and stir-fry until they\'re tender-crisp.',
      step_ingredients: [
        veg_oil
      ]
    )
  ]
).save
