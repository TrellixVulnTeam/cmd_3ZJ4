
# �h���b�O���h���b�v�̎���

Add-Type -AssemblyName System.Windows.Forms

$form = New-Object System.Windows.Forms.Form
$form.Size = "300,300"
$form.StartPosition = "CenterScreen"
$form.Text = "�^�C�g��"

# ���X�g�{�b�N�X�̐���
$Listbox =  New-Object System.Windows.Forms.ListBox
$Listbox.Location = "10,10"
$Listbox.Size = "260,200"
$Listbox.AllowDrop = $True

# �h���b�O�G���^�[�@�C�x���g
$Enter = {
�@�@$_.Effect = "All"
}
$Listbox.Add_DragEnter($Enter)

# �h���b�O�h���b�v�@�C�x���g
$Drop = {
    $Name = @($_.Data.GetData("FileDrop"))

    # 1���擾���A���X�g�{�b�N�X�ɒǉ�
    For ( $i = 0 ; $i -lt $Name.Count ; $i++ )
    {
        [void]$Listbox.Items.Add($Name[$i])
    }
}
$Listbox.Add_DragDrop($Drop)

# ����{�^��
$Button = New-Object System.Windows.Forms.Button
$Button.Location = "200,220"
$Button.size = "80,30"
$Button.text  =�@"����"
$Button.DialogResult = [System.Windows.Forms.DialogResult]::Cancel

$form.Controls.AddRange(@($Listbox,$Button))

$Form.Showdialog()