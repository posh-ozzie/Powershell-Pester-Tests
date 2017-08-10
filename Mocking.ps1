#Mocking Basics

function Start-Clustertest {
    param($ClusterName)

    Write-Host 'Doing the thing...'
    Write-Output "I did the thing against $ClusterName!"
}

Start-Clustertest

#Test with no mocking
describe 'Start-ClusterTest' {
    $result = Start-Clustertest -ClusterName 'Server1'

    it 'returns a string with $ClusterName inside' {
        #I know the input and output together
        $result | should be 'I did the thing against Server1!'
    }
}

#Test with mocking. test fails due to command being overwritten
describe 'Start-Clustertest' {

    Mock -CommandName 'Write-Output' -MockWith {
        'No you did not'
    }
    $result = Start-Clustertest -ClusterName 'Server1'

    it 'does the thing' {
        $result | should be "I did the thing against $ClusterName!"
    }
}

#Mocking and Scopes
function Start-Clustertest {
    param($ClusterName)

    Write-Host 'Doing the thing...'
    Write-Output "I did the thing against $ClusterName!"
}

    describe 'Start-Clustertest'{
        #Changing the write-output to 'describemock'
        Mock -CommandName 'Write-Output' -MockWith {
            'describemock'
        }
        $result = Start-Clustertest -ClusterName 'Server1'

        it 'does the thing in the describe block' {
            $result | should be 'describemock'
        }

        Context 'Mockscope' {

        }
    }