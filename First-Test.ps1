#First Basic Pester Test
#Created whilst doing the MVA Pester Courses

Describe 'first test' {

    Context 'arithmatic' {
        it '1 plus 1 should be 2' {
            1 + 1 | should be 2
        }
        it '3 minus 2 should be 1' {
            3 - 2 | should be 1
        }
    }
    Context 'AAA Approach' {

        $stringToTest = 'team'

        it 'an i should not be in team - like assertion' {
            $stringToTest | should not belike '*i*'
        }
         it 'an i should not be in team - like assertion' {
            $stringToTest | should not match 'i'
         }
    }
}