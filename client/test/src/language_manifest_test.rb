require_relative 'test_base'

class LanguageManifestTest < TestBase

  def self.hex_prefix
    'D4735'
  end

  # - - - - - - - - - - - - - - - - - - - -

  test '266',
  %w( valid major_name,minor_name,exercise_name with no optional properties ) do

    manifest = language_manifest('C#', 'NUnit', 'Fizz_Buzz')

    expected_keys = %w(
      display_name image_name runner_choice visible_files
      exercise
    )
    assert_equal expected_keys.sort, manifest.keys.sort

    assert_equal 'C#, NUnit', manifest['display_name']
    assert_equal 'Fizz_Buzz', manifest['exercise']
    assert_equal 'cyberdojofoundation/csharp_nunit', manifest['image_name']
    assert_equal 'stateless', manifest['runner_choice']
    expected_filenames = %w( Hiker.cs HikerTest.cs cyber-dojo.sh instructions output )
    assert_equal expected_filenames, manifest['visible_files'].keys.sort
  end

end