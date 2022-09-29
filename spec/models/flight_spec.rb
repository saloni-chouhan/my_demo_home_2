describe Flight do
	it { is_expected.to callback(:check_length_of_name).after(:create) }
end